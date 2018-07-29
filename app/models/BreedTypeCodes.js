module.exports = function(sequelize, Sequelize) {
    var BreedTypeCodes = sequelize.define('BreedTypeCodes', {
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

    BreedTypeCodes.removeAttribute('id');
    
    return BreedTypeCodes;
}
