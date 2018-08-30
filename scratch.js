require('./knexfile');

var f = async () => {
    result = await getAuthors(knex, {});
    return result
}

var g = () => {
    result = getAuthors(knex, {});
    return result
}