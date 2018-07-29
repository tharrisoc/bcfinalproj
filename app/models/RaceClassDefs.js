module.exports = function(sequelize, Sequelize) {
    var RaceClassDefs = sequelize.define('RaceClassDefs', {
          RaceClassCode: {
             type: Sequelize.CHAR
         },
         RaceClassName: {
             type: Sequelize.STRING
         },
         Description: {
            type: Sequelize.TEXT
        }
     },
       {
         timestamps: false
       },
       {
          indexes: [
              {
                  unique: true,
                  fields: ['RaceClassCode']
              }
          ]
       }
    );

    RaceClassDefs.removeAttribute('id');
    
    return RaceClassDefs;
}
