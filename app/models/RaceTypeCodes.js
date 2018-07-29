module.exports = function(sequelize, Sequelize) {
    var RaceTypeCodes = sequelize.define('RaceTypeCodes', {
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

    RaceTypeCodes.removeAttribute('id');
    
    return RaceTypeCodes;
}
