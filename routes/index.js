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

router.get("/sharedcart", async (req, res, next) => {
    let partlist = [];
    let invitelist = [];
    partlist = [
        {
            공유장바구니식별번호: 1,
            장바구니명: "데이터베이스 101분반",
            공유중인회원: "-",
            결제동의마감일: "2022-12-30",
            동의현황: "진행전",
        },
    ];
    // invitelist = [
    //     {
    //         공유장바구니식별번호: 2,
    //         장바구니명: "데이터베이스 101분반",
    //         초대를보낸회원: "김현수(st20181501)",
    //         초대일: "2022-12-15",
    //     },
    // ];
    res.render("sharedcartlist", { partlist, invitelist, isLogined });
});

router.get("/sharedcart/:id", async (req, res, next) => {
    const isLogined = req.session.isLogined;
    let sharedcartid = req.params.id;
    // 공유장바구니식별번호로 조회한 장바구니 정보, sql문 추가 필요
    cartinfo = [
        {
            공유장바구니식별번호: 1,
            장바구니명: "데이터베이스 101분반",
            공유중인회원: "-",
            결제동의마감일: "2022-12-30",
            동의현황: "진행전",
        },
    ];
    cartuserinfo = [
        {
            아이디: "st20181501",
            이름: "김현수",
        },
        {
            아이디: "st20181468",
            이름: "김기훈",
        },
        {
            아이디: "st20181604",
            이름: "전탁준",
        },
    ];
    let users = "";
    for (let i = 0; i < cartuserinfo.length; i++) {
        users += cartuserinfo[i].이름;
        if (i != cartuserinfo.length - 1) {
            users += ", ";
        }
    }
    console.log(users);
    cartlist = [
        {
            도서식별번호: 4,
            도서명: "데이터베이스 개론",
            가격: 29_000,
            수량: 10,
            소계: 290_000,
        },
    ];

    res.render("sharedcart", { cartinfo, users, cartlist, isLogined });
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
