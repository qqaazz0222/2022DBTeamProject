const express = require("express");
const session = require("express-session");
const router = express.Router();
const pool = require("../db/db");
const sessionStore = require("../db/session");

router.get("/", async (req, res, next) => {
    const isLogined = req.session.isLogined;
    console.log(isLogined);

    // 참여중인 공유 장바구니
    let partlist = await pool.query(
        "select * from 공유회원항목 sh inner join 공유장바구니 shb on sh.공유장바구니식별번호 = shb.공유장바구니식별번호 where 회원아이디 = 'user1' and 초대수락여부=1 "
    );
    // 초대받은 공유 장바구니
    let invitelist = await pool.query(
        "select * from 공유회원항목 sh inner join 공유장바구니 shb on sh.공유장바구니식별번호 = shb.공유장바구니식별번호 where 회원아이디 = 'user1' and 초대수락여부=0 "
    );

    // partlist = [
    //     {
    //         공유장바구니식별번호: 1,
    //         장바구니명: "데이터베이스 101분반",
    //         공유중인회원: "-",
    //         결제동의마감일: "2022-12-30",
    //         동의현황: "진행전",
    //     },
    // ];
    // invitelist = [
    //     {
    //         공유장바구니식별번호: 2,
    //         장바구니명: "데이터베이스 101분반",
    //         초대를보낸회원: "김현수(st20181501)",
    //         초대일: "2022-12-15",
    //     },
    // ];
    res.render("sharedcartlist", {
        partlist: partlist[0],
        invitelist: invitelist[0],
        isLogined,
    });
});

router.get("/:id", async (req, res, next) => {
    const isLogined = req.session.isLogined;
    let sharedcartid = req.params.id;
    // 공유장바구니 식별번호 장바구니 항목
    let cartlist = await pool.query(
        "select * from 공유장바구니 s inner join 공유장바구니_항목 b on s.공유장바구니식별번호 = b.공유장바구니식별번호 inner join 도서 bo on b.도서식별번호 = bo.도서식별번호"
    );

    console.log("sss");
    console.log(cartlist[0]);

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
    // cartlist = [
    //     {
    //         도서식별번호: 4,
    //         도서명: "데이터베이스 개론",
    //         가격: 29_000,
    //         수량: 10,
    //         소계: 290_000,
    //     },
    // ];

    res.render("sharedcart", {
        cartinfo,
        users,
        cartlist: cartlist[0],
        isLogined,
    });
});

// 장바구니 생성 화면
router.get("/create/bas", async (req, res, next) => {
    const isLogined = req.session.isLogined;
    console.log("ss");
    res.render("createsharebasket", { isLogined });
});

// 장바구니 생성
router.post("/create/basket", async (req, res, next) => {
    console.log("sss");
    const { 공유장바구니이름, 구매예정일 } = req.body;
    let sess = req.session.uid;
    console.log(공유장바구니이름, 구매예정일);

    let today = new Date();
    const year = today.getFullYear().toString();
    const month = (today.getMonth() + 1).toString();
    const date = today.getDate().toString();
    const makeDate = year.concat("/", month).concat("/", date);

    try {
        console.log("sss");
        let create = await pool.query(
            "INSERT INTO 공유장바구니(공유장바구니이름, 생성자, 결제자,  생성일자 , 구매예정일) values(?, ?, ?, ? ,? )",
            [공유장바구니이름, sess, sess, makeDate, 구매예정일]
        );
        console.log("sss");

        return res.send(
            '<script type="text/javascript">alert("장바구니가 생성되었습니다.."); document.location.href="/sharedcart";</script>'
        );
    } catch (error) {
        console.log(error);
    }
});

// 결제 동의
router.get("/agree/yes", async (req, res, next) => {
    console.log("agree");
    const isLogined = req.session.isLogined;
    const uid = req.session.uid;
    const { basket_id } = req.params;
    console.log("ss");

    console.log(basket_id);
    try {
        console.log("sss");
        let aree = await pool.query(
            "update 공유회원항목 set 결제수락여부 = 1 where 회원아이디 = ? and 공유장바구니식별번호= ?",
            [uid, basket_id]
        );
        console.log("sss");

        return res.send(
            '<script type="text/javascript">alert("결제동의 하셨습니다."); document.location.href="/sharedcart/1";</script>'
        );
    } catch (error) {
        console.log(error);
    }
});

// 결제자 변경
router.post("/change/chanagepayer", async (req, res, next) => {
    try {
        console.log("ccc");
        let chanagepayer = await pool.query(
            "update 공유장바구니 set 결제자 = 'user2' where 장바구니식별번호 = 3 "
        );
        console.log("ccc");

        return res.send(
            '<script type="text/javascript">alert("결제자가 변경되었습니다."); document.location.href="/sharedcart/1";</script>'
        );
    } catch (error) {
        console.log(error);
    }
});

// 회원 초대 화면
router.post("/invite/inviteuser", async (req, res, next) => {
    try {
        return res.send(
            '<script type="text/javascript">alert("회원이 초대되었습니다."); document.location.href="/sharedcart/1";</script>'
        );
    } catch (error) {
        console.log(error);
    }
});

// 회원 초대
router.post("/invite/inviteuser2", async (req, res, next) => {
    try {
        console.log("iii");
        let inviteuser = await pool.query(
            "insert into 공유회원항목(회원아이디,  공유장바구니식별번호,  접근권한여부,  결제수락여부, 초대수락 여부) values(?, ?, ?, ?, ?)",
            [A, B, C, D, E]
        );
        console.log("iii");

        return res.send(
            '<script type="text/javascript">alert("회원이 초대되었습니다."); document.location.href="/sharedcart/1";</script>'
        );
    } catch (error) {
        console.log(error);
    }
});

module.exports = router;
