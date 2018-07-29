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
       }
    );

    SurfaceCodes.removeAttribute('id');
    
    return SurfaceCodes;
}
