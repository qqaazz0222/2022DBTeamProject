const express = require("express");
const session = require("express-session");
const router = express.Router();
const pool = require("../db/db");

router.get("/", async (req, res, next) => {
    const book = await pool.query("SELECT * FROM book;");
    let users = await pool.query("SELECT * FROM user;");
    res.render("home", { book: book[0] });
});

router.get("/book/:bookid", async (req, res, next) => {
    const bookid = parseInt(req.params.bookid);
    const book = await pool.query("SELECT * FROM book WHERE id = ?;", [bookid]);
    res.render("book", { book: book[0] });
});

router.post("/buy/:bookid", async (req, res, next) => {
    const bookid = parseInt(req.params.bookid);
    const { amount } = req.body;
    console.log(bookid, amount);
    res.redirect("/");
});

router.post("/cart/:bookid", async (req, res, next) => {
    const bookid = parseInt(req.params.bookid);
    const { amount } = req.body;
    console.log(bookid, amount);
    res.redirect("/");
});

module.exports = router;
