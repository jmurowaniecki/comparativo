#!/usr/bin/env node

const crypto = require("crypto")
const FS     = require("fs")
const fail   = []

FS.readFileSync(process.argv[2]).toString().split("\n").forEach(element => {
    if (!element) {
        return;
    }
    let [data, hash] = element.split(' ')
    let check = crypto.createHash("md5").update(data).digest("hex")
    if (check !== hash) {
        fail.push(`${data} ${check}`)
    }
});

console.log(fail.join("\n"))
