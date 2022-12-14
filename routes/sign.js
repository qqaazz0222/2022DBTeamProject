const express = require("express");
const router = express.Router();
const pool = require("../db/db");
const sessionStore = require("../db/session");

router.get("/signin", async (req, res, next) => {
    const type = "signin";
    try {
        if (req.session.uid) {
            delete req.session.uid;
            delete req.session.isLogined;
            delete req.session.author_id;
            req.session.save(function () {
                res.redirect("/");
            });
        } else {
            res.render("sign", { type: type });
        }
    } catch (error) {
        return res.redirect("/");
    }
});

router.post("/signin", async (req, res, next) => {
    const { id, pw } = req.body;
    try {
        const user = await pool.query(
            "SELECT * FROM 회원 WHERE 회원아이디 = ?",
            [id]
        );
        console.log(user[0]);
        if (user[0].length > 0) {
            if (pw === user[0][0].비밀번호) {
                req.session.uid = user[0][0].회원아이디;
                req.session.author_id = user[0][0].author_id;
                req.session.isLogined = true;
                req.session.save(function () {
                    res.redirect("/");
                });
            } else {
                res.redirect("/");
            }
        } else {
            res.redirect("/");
        }
    } catch (error) {
        console.log("error");
        res.redirect("/");
    }
});

router.get("/signup", async (req, res, next) => {
    const type = "signup";
    res.render("sign", { type: type });
});

module.exports = router;
