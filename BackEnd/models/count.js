/**
 * Created by junwoo on 2016-07-16.
 */
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var countSchema = new Schema({
    time: String,
    num: Number
});

module.exports = mongoose.model('count',countSchema);