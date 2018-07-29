module.exports = function(sequelize, Sequelize) {
    var CountryNames = sequelize.define('CountryNames', {
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

    CountryNames.removeAttribute('id');
    
    return CountryNames;
}
