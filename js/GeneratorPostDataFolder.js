// Generaros de ficheros .md dentro de la carpeta _posts
// La fuente de esta generacion se encuentra en la carpeta _data
yaml = require('js-yaml');
fs   = require('fs');

var doc = yaml.safeLoad(fs.readFileSync('_data/members.yml', 'utf8'));

for (author in doc){
    var path =  '_posts/authors/0001-01-01-' + author + '.md'

    var content =  '---\n' +
                   'author: ' + author + '\n' +
                   'categories: author\n' +
                   'layout: author\n'  +
                   '---'

    fs.writeFile(path, content , function (err) {
        if (err) throw err;
        console.log('Saved!');
      });
    
}


