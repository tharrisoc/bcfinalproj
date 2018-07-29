module.exports = function(sequelize, Sequelize) {
    var TimeformCodes = sequelize.define('TimeformCodes', {
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

    TimeformCodes.removeAttribute('id');
    
    return TimeformCodes;
}
