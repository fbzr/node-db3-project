const db = require('../data/db-config');

const find = () => db('schemes');

const findById = id => db('schemes').where({id}).first();

const findSteps = scheme_id => {
    return db('steps').where({ scheme_id });
}

const add = async scheme => {
    const responseId = await db('schemes').insert(scheme);
    return db('schemes').where({ id: responseId[0] }).first();
}

const update = async (changes, id) => {
    await db('schemes').where({id}).update({
        ...changes,
        id
    });
    return db('schemes').where({ id }).first();
}

const remove = async id => {
    const scheme = await db('schemes').where({id}).first();
    await db('schemes').where({id}).del();
    return scheme;
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}