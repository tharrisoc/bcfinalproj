module.exports = function(sequelize, Sequelize) {
    var EntrySexCodes = sequelize.define('EntrySexCodes', {
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

    EntrySexCodes.removeAttribute('id');
    
    return EntrySexCodes;
}
