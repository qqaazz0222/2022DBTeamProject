const express = require("express");
const session = require("express-session");
const router = express.Router();
const pool = require("../db/db");
const sessionStore = require("../db/session");

router.use(
    session({
        secret: "sessionkey",
        resave: false,
        saveUninitialized: true,
        store: sessionStore,
    })
);

router.get("/", async (req, res, next) => {
    const isLogined = req.session.isLogined;
    // const book = await pool.query("SELECT * FROM 도서;");
    // let users = await pool.query("SELECT * FROM 회원;");
    const book = await pool.query("SELECT * FROM 도서;");
    res.render("home", { book: book[0], isLogined });
});

router.get("/cart", async (req, res, next) => {
    const isLogined = req.session.isLogined;
    const cartlist = [
        {
            도서식별번호: 1,
            도서명: "역행자",
            가격: 6_000,
            수량: 2,
            소계: 12_000,
        },
        {
            도서식별번호: 2,
            도서명: "어린왕자",
            가격: 5_000,
            수량: 2,
            소계: 10_000,
        },
        {
            도서식별번호: 3,
            도서명: "불편한 편의점",
            가격: 8_000,
            수량: 2,
            소계: 16_000,
        },
    ];
    res.render("cart", { cartlist, isLogined });
});

router.get("/study", async (req, res, next) => {
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
        const roomlist = await pool.query("SELECT * FROM 북스터디방;");
        res.render("mystudy", { roomlist: roomlist[0], isLogined });
    } catch (error) {
        console.log(error);
    }
});

router.get("/studyroom/:id", async (req, res, next) => {
    try {
        const isLogined = req.session.isLogined;
        res.render("studyroom", { isLogined });
    } catch (error) {
        console.log(error);
    }
});

module.exports = router;
