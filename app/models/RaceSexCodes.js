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
       },
       {
          indexes: [
              {
                  unique: true,
                  fields: ['Code']
              }
          ]
       }
    );

    RaceSexCodes.removeAttribute('id');

    return RaceSexCodes;
}
