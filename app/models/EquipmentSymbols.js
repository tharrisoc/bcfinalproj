module.exports = function(sequelize, Sequelize) {
    var EquipmentSymbols = sequelize.define('EquipmentSymbols', {
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

    EquipmentSymbols.removeAttribute('id');
    
    return EquipmentSymbols;
}
