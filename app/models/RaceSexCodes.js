module.exports = function(sequelize, Sequelize) {
    var RaceSexCodes = sequelize.define('RaceSexCodes', {
          Code: {
             type: Sequelize.CHAR
         },

         Description: {
             type: Sequelize.STRING
         }
       },
       {
         timestamps: false
       }
    );

    RaceSexCodes.removeAttribute('id');

    return RaceSexCodes;
}
