module.exports = function(sequelize, Sequelize) {
    var AgeCodes = sequelize.define('AgeCodes', {
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

    AgeCodes.removeAttribute('id');
    
    return AgeCodes;
}
