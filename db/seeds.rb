chicago = ["Chicago"=>{ ["Chicago Transit Authority", 'studio']=>[["Beginnings","regular"], ["Questions 67 and 68", "bonus"]], ["Nashville Live!",'live']=>[['25 or 6 to 4','regular']]}]
beatles =["The Beatles"=>{['Revolver', 'studio']=>[["Taxman","regular"],["We Can Work It Out", "bonus"]],['Live at Shea', 'live']=>[["I feel fine", "regular"]]}]

bands = chicago + beatles

bands.each do |band|

  new_band = Band.create(name: band.keys.first)
  band.values.each do |albums|
    albums.each do |album, tracks|
      new_album = Album.create!(name: album[0], format: album[1], band_id: new_band.id)

      tracks.each do |track|
        Track.create!(name: track[0], status: track[1], album_id: new_album.id)
      end
    end
  end
end
