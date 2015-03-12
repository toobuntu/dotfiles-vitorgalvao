#!/usr/bin/env ruby

chrome_extensions = {
  :onepassword => 'aomjjhallfgjeglblehebfpbcfeobpgk',
  :buffer => 'noojglkidnpfjbincgijbaiedldjfbhh',
  :earthviewfromgooglemaps => 'bhloflhklmhfpedakmangadcdofhnnoh',
  # :googleartproject => 'akimgimeeoiognljlfchpbkpfbmeapkh',
  :mediakeysforovercast => 'iomjboggdipkbeddinniaoiffjibdach',
  # :palettab => 'bidckpnndigbjhmojikkhmejkfkpgoih',
  :ublock => 'cjpalhdlnbpafiamejdnhcphjbkeiagm',
  :vimium => 'dbepggeogbaibhgnhhndojpepiihcmeb'
}

canary_extensions = {
  :chromeextensionsdeveloper => 'ohmmkhmmmpcnpikjeljgnaoabkaalbgc',
  :emmetlivestyle => 'diebikgmpmeppiilkaijjbdgciafajmg',
  :holabetterinternet => 'gkojfkhlekighikafcpjkiklfbnlmeio',
  :livereload => 'jnihajbhpnppcggbcgedagnkighmdlei',
  :selectorgadget => 'mhjhnkcfbdhnjickkkdbjoemdmbfginb',
  :snappysnippet => 'blfngdefapoapkcdibbdkigpeaffgcil',
  :tincr => 'lfjbhpnjiajjgnjganiaggebdhhpnbih'
}

chrome_executable = %x(mdfind kMDItemCFBundleIdentifier = com.google.Chrome).strip + '/Contents/MacOS/Google Chrome'
canary_executable = %x(mdfind kMDItemCFBundleIdentifier = com.google.Chrome.canary).strip + '/Contents/MacOS/Google Chrome Canary'

chrome_extensions.values.each do |value|
  system(chrome_executable, '--no-first-run', '--disable-default-apps', "--install-from-webstore=#{value}")
end

canary_extensions.values.each do |value|
  system(canary_executable, '--no-first-run', '--disable-default-apps', "--install-from-webstore=#{value}")
end