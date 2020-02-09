<div>
  <h1>Free <?php echo $lister->getLang(); ?> FSTs for morphological generation and analysis</h1>
  <p><?php echo $lister->getLang(); ?> is one of the languages that is supported by UralicNLP. The goal of this website is to provide free FST transducers for multiple languages, mostly as nightly builds. You can use the <?php echo $lister->getLang(); ?> analyzer and generator with <a href="https://github.com/mikahama/uralicNLP">UralicNLP</a></p>
  <p><b>Install UralicNLP:</b></p>
  <pre><code>pip install uralicNLP
python -m uralicNLP.download -l <?php echo $lister->getLangCode(); ?>
</code></pre>
  <p><b>Usage</b></p>
  <pre><code>from uralicNLP import uralicApi
uralicApi.lemmatize(word, "<?php echo $lister->getLangCode(); ?>")
uralicApi.analyze(word, "<?php echo $lister->getLangCode(); ?>")
uralicApi.generate(word, "<?php echo $lister->getLangCode(); ?>")
</code></pre>

<p>Please, refer to <a href="https://github.com/mikahama/uralicNLP">UralicNLP documentation</a> for more information.</p>

<h2>Metadata</h2>

<?php echo $lister->getMetadata(); ?>

<h2>Files</h2>
<p>You can also download the transducers directly here:</p>

</div>