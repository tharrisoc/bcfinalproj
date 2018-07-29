module.exports = function(sequelize, Sequelize) {
    var MedicationSymbols = sequelize.define('MedicationSymbols', {
          Symbol: {
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
                  fields: ['Symbol']
              }
          ]
       }
    );

    MedicationSymbols.removeAttribute('id');
    
    return MedicationSymbols;
}
