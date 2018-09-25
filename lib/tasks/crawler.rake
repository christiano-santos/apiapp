namespace :crawler do
  desc "Rotina para atualização do banco de dados"
  task bot: :environment do
    puts "inicializando" 
    def crawler
      puts "entrando no metodo"
      url_base = 'https://www.instagram.com/'
      browser =  Watir::Browser.new :chrome, headless: true
      imgs =  Watir::Browser.new :chrome, headless: true #tentar remover esta instancia do Browser
      imagens = ""
      titulo = ""
      anuncio_img = ""
      locais = { 1 => ["kangacoteresina", "cajuinashowsthe"],
                 2 => ["seubotecoteresina/?hl=pt-br"],
                 3 => ["la_ganadaria/?hl=pt-br", "baiaodedoisthe", "texanopicanharia/?hl=pt-br"]}  
      #Dir.chdir("#{Rails.root}/public/anuncios")
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
            categoria = key.to_i
            titulo = browser.h1
            puts titulo.text
            estabelecimento = titulo.text
            nome = imagens[i].alt
            nome = nome[0,20]
            src = imagens[i].src
            imgs.goto src
            #File.write(nome+".jpg", imgs.image().to_jpg_base64)
            anuncio_img = imgs.image().to_jpg_base64
            #anuncio_img = Base64.encode64(open("#{Rails.root}/public/anuncios/#{nome}.jpg"){ |io| io.read })
            Ad.create(category_id: categoria, establishment: estabelecimento, description: nome, image: anuncio_img)
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
