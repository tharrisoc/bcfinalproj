module.exports = function(sequelize, Sequelize) {
    var InnerCodes = sequelize.define('InnerCodes', {
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

    InnerCodes.removeAttribute('id');
    
    return InnerCodes;
}
