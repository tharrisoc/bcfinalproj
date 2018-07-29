module.exports = function(sequelize, Sequelize) {
    var StateNames = sequelize.define('StateNames', {
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

    StateNames.removeAttribute('id');
    
    return StateNames;
}
