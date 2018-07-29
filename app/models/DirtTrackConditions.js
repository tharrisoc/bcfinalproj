module.exports = function(sequelize, Sequelize) {
    var DirtTrackConditions = sequelize.define('DirtTrackConditions', {
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

    DirtTrackConditions.removeAttribute('id');
    
    return DirtTrackConditions;
}
