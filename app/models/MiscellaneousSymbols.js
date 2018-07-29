module.exports = function(sequelize, Sequelize) {
    var MiscellaneousSymbols = sequelize.define('MiscellaneousSymbols', {
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

    MiscellaneousSymbols.removeAttribute('id');
    
    return MiscellaneousSymbols;
}
