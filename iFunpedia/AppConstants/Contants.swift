//
//  Contants.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import Foundation

typealias Dict = [String :AnyObject]
typealias AnyArray = [AnyObject]
typealias StringArray = [String]

let TYPE_URL       = "typeUrl"

let MTk_AudioBooks = "Audio Books"
let Tk_AudioBooks  = "Top Audio Books"



/*
 
 //        Books
 //        top free books
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/json
 //        top paid books
 //        https://itunes.apple.com/us/rss/toppaidebooks/limit=10/json
 //        top text books
 //        https://itunes.apple.com/us/rss/toptextbooks/limit=10/json
 
 
 //        art & entertainment
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9007/json
 //        biographies & memoirs
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9008/json
 //        business & personal finance
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9009/json
 //        children & teens
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9010/json
 //        comics & graphic novels
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9026/json
 //        computer & internet
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9027/json
 //        cookbooks, food & wine
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9028/json
 //        fiction & literature
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9031/json
 //        health,mind & body
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9025/json
 //        history
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9015/json
 //        humor
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9012/json
 //        lifestyle & home
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9024/json
 //        mysteries & thrillers
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9032/json
 //        nonfiction
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9002/json
 //        parenting
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9030/json
 //        politics & current events
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9034/json
 //        professional & technical
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9029/json
 //        referance
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9033/json
 //        religion & spirituality
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9018/json
 //        romance
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9003/json
 //        sci-fi & fantasy
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9020/json
 //        science & nature
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9019/json
 //        sports & outdoors
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9035/json
 //        Travel & Adventure
 //        https://itunes.apple.com/us/rss/topfreeebooks/limit=10/genre=9004/json
 
 
 
 
 
 
 
 
 
 
 //        Apps
 //        new apps
 //        https://itunes.apple.com/us/rss/newapplications/limit=10/json
 //        new free apps
 //        https://itunes.apple.com/us/rss/newfreeapplications/limit=10/json
 //        new paid apps
 //        https://itunes.apple.com/us/rss/newpaidapplications/limit=10/json
 //        top free apps
 //        https://itunes.apple.com/us/rss/topfreeapplications/limit=10/json
 //        top free ipad apps
 //        https://itunes.apple.com/us/rss/topfreeipadapplications/limit=10/json
 //        top grossing apps
 //        https://itunes.apple.com/us/rss/topgrossingapplications/limit=10/json
 //        top grossing ipad apps
 //        https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=10/json
 //        top paid apps
 //        https://itunes.apple.com/us/rss/toppaidapplications/limit=10/json
 //        top paid ipad apps
 //        https://itunes.apple.com/us/rss/toppaidipadapplications/limit=10/json
 
 
 
 //        ItuneU
 //        top itunes collections
 //        https://itunes.apple.com/us/rss/topitunesucollections/limit=10/json
 //        top itunesU cources
 //        https://itunes.apple.com/us/rss/topitunesucourses/limit=10/json
 
 
 //        top movies
 //        https://itunes.apple.com/us/rss/topmovies/limit=10/json
 
 
 //        top video rentals
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/json
 
 
 //        action&adventure
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4401/json
 //        african
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4434/json
 //        anime
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4402/json
 //        bollywood
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4431/json
 //        classics
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4403/json
 //        comedy
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4404/json
 //        concert films
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4422/json
 //        documentary
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4405/json
 //        drama
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4406/json
 //        foreign
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4407/json
 //        holiday
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4420/json
 //        horror
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4408/json
 //        independent
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4409/json
 //        japanese cinema
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4425/json
 //        jidaigeki
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4426/json
 //        kids & family
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4410/json
 //        korean cinema
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4428/json
 //        made for TV
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4421/json
 //        middle eastern
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4433/json
 //        music documentaries
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4423/json
 //        music feature films
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4424/json
 //        musicals
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4411/json
 //        regional indian
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4432/json
 //        romance
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4412/json
 //        russian
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4429/json
 //        sci-fi & fantasy
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4413/json
 //        short films
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4414/json
 //        special interest
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4415/json
 //        sports
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4417/json
 //        thriller
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4416/json
 //        tokusatsu
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4427/json
 //        turkish
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4430/json
 //        urban
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4419/json
 //        western
 //        https://itunes.apple.com/us/rss/topvideorentals/limit=10/genre=4418/json
 
 
 
 //        music
 //        featured albums
 //        https://itunes.apple.com/WebObjects/MZStore.woa/wpa/MRSS/featuredalbums/sf=143441/limit=10/rss.json
 
 //        just added
 //        https://itunes.apple.com/WebObjects/MZStore.woa/wpa/MRSS/justadded/sf=143441/limit=10/rss.json
 
 //        new releases
 //        https://itunes.apple.com/WebObjects/MZStore.woa/wpa/MRSS/newreleases/sf=143441/limit=10/rss.json
 
 //        top albums
 //        https://itunes.apple.com/us/rss/topalbums/limit=10/json
 //        top imixes
 //        https://itunes.apple.com/us/rss/topimixes/limit=10/json
 //        top songs
 //        https://itunes.apple.com/us/rss/topsongs/limit=10/json
 
 
 //        music videos
 //        top music videos
 //        https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json
 //        top podcasts
 //        https://itunes.apple.com/us/rss/toppodcasts/limit=10/json
 
 
 //        TV Shows
 //        top tv episodes
 //        https://itunes.apple.com/us/rss/toptvepisodes/limit=10/json
 //        top tv seasons
 //        https://itunes.apple.com/us/rss/toptvseasons/limit=10/json
 
 
 
 
 
 //        Action & Adventure
 //        African
 //        All
 //        Anime
 //        Bollywood
 //        Classics
 //        Comedy
 //        Concert Films
 //        Documentary
 //        Drama
 //        Foreign
 //        Holiday
 //        Horror
 //        Independent
 //        Japanese Cinema
 //        Jidaigeki
 //        Kids & Family
 //        Korean Cinema
 //        Made for TV
 //        MiddleEastern
 //        Music Documentaries
 //        Music Feature Films
 //        Musicals
 //        Regional Indian
 //        Romance
 //        Russian
 //        Sci-Fi & Fantasy
 //        Short Films
 //        Special Interest
 //        Sports
 //        Thriller
 //        Tokusatsu
 //        Turkish
 //        Urban
 //        Western
 
 
 
 
 

 */