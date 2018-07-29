module.exports = function(sequelize, Sequelize) {
    var NorthAmericanTracks = sequelize.define('NorthAmericanTracks', {
          TrackCode: {
             type: Sequelize.CHAR
         },
         ShortName: {
             type: Sequelize.STRING
         },
         LongName: {
            type: Sequelize.STRING
        },
        State: {
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
                  fields: ['TrackCode']
              }
          ]
       }
    );

    NorthAmericanTracks.removeAttribute('id');
    
    return NorthAmericanTracks;
}
