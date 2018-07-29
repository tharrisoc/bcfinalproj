module.exports = function(sequelize, Sequelize) {
    var CanadaProvNames = sequelize.define('CanadaProvNames', {
          Name: {
             type: Sequelize.STRING
         },

         Abbrev: {
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
                  fields: ['Name']
              },
              {
                  unique: true,
                  fields: ['Abbrev']
              }
          ]
       }
    );

    CanadaProvNames.removeAttribute('id');
    
    return CanadaProvNames;
}
