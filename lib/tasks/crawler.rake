namespace :crawler do
  desc "Rotina para atualização do banco de dados"
  task bot: :environment do
    puts "inicializando" 
    def crawler
      puts "entrando no metodo"
      ads = AdsController.new
      url_base = 'https://www.instagram.com/'
      browser =  Watir::Browser.new :chrome, headless: true
      imgs =  Watir::Browser.new :chrome, headless: true #tentar remover esta instancia do Browser
      imagens = ""
      titulo = ""
      anuncio_img = ""
      locais = { 1 => ["kangacoteresina", "cajuinashowsthe"],
                 2 => ["seubotecoteresina/?hl=pt-br"],
                 3 => ["la_ganadaria/?hl=pt-br", "baiaodedoisthe", "texanopicanharia/?hl=pt-br"]}  
      Dir.chdir("#{Rails.root}/public")
      locais.each_pair do |key,value|
        value.each { |local|  
          puts "********************"
          puts value
          puts url_base+local
          puts "********************"
          browser.goto url_base+local
          puts "abrindo site"
          imagens = browser.imgs(class: %w(FFVAD))
          i = 0
          while i <= 2
            ad = Ad.new
            ad.category_id = key.to_i
            titulo = browser.h1
            ad.establishment = titulo.text
            nome = imagens[i].alt
            ad.description = nome
            nome = nome[0,20]
            src = imagens[i].src
            imgs.goto src
            File.write(nome+".jpg", imgs.image().to_jpg_base64)
            #anuncio_img = imgs.image().to_jpg_base64
            ad.image = Base64.encode64(open("#{Rails.root}/public/#{nome}.jpg"){ |io| io.read })
            puts ad.image
            ads.create(ad)
            sleep(5)
            i = i + 1
          end
        }
        sleep(10)
      end
    end
    crawler();
  end
end
