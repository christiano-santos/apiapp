namespace :crawler do
  desc "Rotina para atualização do banco de dados"
  task bot: :environment do
    puts "inicializando" 
    def crawler
      puts "entrando no metodo"
      url_base = 'https://www.instagram.com/'
      browser =  Watir::Browser.new :chrome, headless: true
      imgs =  Watir::Browser.new :chrome, headless: true 
      imagens = ""
      titulo = ""
      anuncio_img = ""
      locais = { 1 => ["kangacoteresina", "cajuinashowsthe"],
                 2 => ["seubotecoteresina/?hl=pt-br"],
                 3 => ["la_ganadaria/?hl=pt-br", "baiaodedoisthe", "texanopicanharia/?hl=pt-br"]}  
      Dir.chdir("#{Rails.root}/public/anuncios")
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
            descricao = nome
            nome = nome[0,20]
            src = imagens[i].src
            imgs.goto src
            File.write("#{nome}.png", imgs.image().to_png.force_encoding(Encoding::UTF_8))
            anuncio_img = open("#{Rails.root}/public/anuncios/#{nome}.png")
            ad = Ad.new(category_id: categoria, establishment: estabelecimento, description: descricao, image: anuncio_img)
            ad.save
            sleep(5)
            File.delete("#{nome}.png")
            i = i + 1
          end
        }
        sleep(10)
      end
    end
    crawler();
  end
end
