module.exports = function(sequelize, Sequelize) {
    var BeatenLengths = sequelize.define('BeatenLengths', {
          Description: {
             type: Sequelize.CHAR
         },

         LowCode: {
             type: Sequelize.DECIMAL(3,2)
         },
         HighCode: {
            type: Sequelize.DECIMAL(3,2)
        },
        Comment: {
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
                  fields: ['Description']
              }
          ]
       }
    );

    BeatenLengths.removeAttribute('id');
    
    return BeatenLengths;
}
