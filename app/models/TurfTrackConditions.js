module.exports = function(sequelize, Sequelize) {
    var TurfTrackConditions = sequelize.define('TurfTrackConditions', {
          TrackCondition: {
             type: Sequelize.CHAR
         },
         Description: {
             type: Sequelize.STRING
         },
         Explanation: {
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
                  fields: ['TrackCondition']
              }
          ]
       }
    );

    TurfTrackConditions.removeAttribute('id');
    
    return TurfTrackConditions;
}
