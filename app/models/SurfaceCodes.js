module.exports = function(sequelize, Sequelize) {
    var SurfaceCodes = sequelize.define('SurfaceCodes', {
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

    SurfaceCodes.removeAttribute('id');
    
    return SurfaceCodes;
}
