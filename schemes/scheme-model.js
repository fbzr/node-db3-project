const db = require('../data/db-config');

const find = () => db('schemes');

const findById = id => db('schemes').where({id}).first();

const findSteps = scheme_id => {
    return db('steps')
    .join('schemes', 'schemes.id', 'steps.scheme_id')
    .where({ scheme_id }).orderBy('step_number')
    .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions');
}

const addStep = async (step, scheme_id) => {
    const responseId = await db('steps').insert({
        ...step,
        scheme_id
    }, 'id');
    return db('steps').where({ id: responseId[0] }).first();
}

const add = async scheme => {
    const responseId = await db('schemes').insert(scheme, 'id');
    return findById(responseId[0]);
}

const update = async (changes, id) => {
    await db('schemes').where({id}).update({
        ...changes,
        id
    });
    return findById(id);
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
    remove,
    addStep
}