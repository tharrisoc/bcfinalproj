module.exports = function(sequelize, Sequelize) {
    var WorkoutSurfaceCodes = sequelize.define('WorkoutSurfaceCodes', {
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

    WorkoutSurfaceCodes.removeAttribute('id');
    
    return WorkoutSurfaceCodes;
}
