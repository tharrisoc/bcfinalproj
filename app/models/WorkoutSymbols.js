module.exports = function(sequelize, Sequelize) {
    var WorkoutSymbols = sequelize.define('WorkoutSymbols', {
          Symbol: {
             type: Sequelize.CHAR
         },

         Description: {
             type: Sequelize.CHAR
         }
       },
       {
         timestamps: false
       },
       {
          indexes: [
              {
                  unique: true,
                  fields: ['Symbol']
              }
          ]
       }
    );

    WorkoutSymbols.removeAttribute('id');
    
    return WorkoutSymbols;
}
