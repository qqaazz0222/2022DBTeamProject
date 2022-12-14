const express = require("express");
const session = require("express-session");
const router = express.Router();
const pool = require("../db/db");
const sessionStore = require("../db/session");

router.get("/", async (req, res, next) => {
    try {
        const isLogined = req.session.isLogined;
        const roomlist = await pool.query("SELECT * FROM 북스터디방;");
        res.render("study", { roomlist: roomlist[0], isLogined });
    } catch (error) {
        console.log(error);
    }
});

router.get("/mystudy", async (req, res, next) => {
    try {
        const isLogined = req.session.isLogined;
        console.log(req.session.uid);
        const roomids = await pool.query(
            "SELECT * FROM 북스터디방회원 WHERE 회원아이디 = ?;",
            [req.session.uid]
        );
        console.log(roomids[0]);
        let roomidstr = "";
        for (var i = 0; i < roomids[0].length; i++) {
            if (i == roomids[0].length - 1) {
                roomidstr += roomids[0][i].북스터디방식별번호;
            } else {
                roomidstr += roomids[0][i].북스터디방식별번호 + ", ";
            }
        }
        const roomlist = await pool.query(
            "SELECT * FROM 북스터디방 WHERE 북스터디방식별번호 in (?);",
            [roomidstr]
        );
        res.render("mystudy", { roomlist: roomlist[0], isLogined });
    } catch (error) {
        console.log(error);
    }
});

router.get("/studyroom/:id", async (req, res, next) => {
    try {
        const isLogined = req.session.isLogined;
        const roominfo = await pool.query(
            "SELECT * FROM 북스터디방 WHERE `북스터디방식별번호` = ?;",
            [req.params.id]
        );
        const selbookinfo = await pool.query(
            "SELECT * FROM 투표도서 WHERE 북스터디방식별번호 = ? and 회차 = ? and 선택여부 = 1;",
            [req.params.id, roominfo[0][0].진행회차]
        );
        const bookinfo = await pool.query(
            "SELECT * FROM 도서 WHERE 도서식별번호 = ?;",
            [selbookinfo[0][0].도서식별번호]
        );
        const chatlist = await pool.query(
            "SELECT * FROM 북스터디내용 WHERE 북스터디방식별번호 = ?;",
            [req.params.id]
        );
        res.render("studyroom", {
            roominfo: roominfo[0][0],
            bookinfo: bookinfo[0][0],
            chatlist: chatlist[0],
            isLogined,
            uid: req.session.uid,
        });
    } catch (error) {
        console.log(error);
    }
});

router.post("/studyroom/:id", async (req, res, next) => {
    try {
        const t = new Date();
        const { msg, ri, rr } = req.body;
        const chatlist = await pool.query(
            "INSERT INTO 북스터디내용 VALUES(NULL, NULL, 0, ?, ?, ?, ?, ?);",
            [ri, rr, req.session.uid, t, msg]
        );
        res.redirect("/study/studyroom/" + req.params.id);
    } catch (error) {
        console.log(error);
    }
});

router.get("/addsubject/:id", async (req, res, next) => {
    try {
        const isLogined = req.session.isLogined;
        const roominfo = await pool.query(
            "SELECT * FROM 북스터디방 WHERE `북스터디방식별번호` = ?;",
            [req.params.id]
        );
        res.render("addsubject", {
            roomid: req.params.id,
            roominfo: roominfo[0][0],
            isLogined,
            uid: req.session.uid,
        });
    } catch (error) {
        console.log(error);
    }
});

router.post("/addsubject", async (req, res, next) => {
    try {
        const t = new Date();
        const { ri, rr, subject } = req.body;
        const addsubject = await pool.query(
            "INSERT INTO 북스터디내용 VALUES(NULL, NULL, 1, ?, ?, ?, ?, ?);",
            [ri, rr, req.session.uid, t, subject]
        );
        res.redirect("/study/studyroom/" + ri);
    } catch (error) {
        console.log(error);
    }
});

module.exports = router;
