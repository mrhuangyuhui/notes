<!-- omit in toc -->
# Maven - Commands

- [`help:describe`](#helpdescribe)
- [`archetype:generate`](#archetypegenerate)

[Maven CLI Options Reference](https://maven.apache.org/ref/3.6.3/maven-embedder/cli.html)

```bash
mvn -h
mvn --help
```

```bash
mvn -v
mvn --version
```

## `help:describe`

```bash
mvn help:describe -Dplugin=org.apache.maven.plugins:maven-help-plugin
```

## `archetype:generate`

Generate project

```bash
mvn archetype:generate
```

Filtering to reduce archetype list

```bash
# With a mojo parameter:
mvn archetype:generate -Dfilter=org.apache:struts

# Through the prompt:
mvn archetype:generate
Choose a number or apply filter (format: [groupId:]artifactId, case sensitive contains): org.apache:struts
```

Generate project in batch mode

```bash
mvn archetype:generate -B \
-DarchetypeGroupId=org.apache.maven.archetypes \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.1 \
-DgroupId=com.company \
-DartifactId=project \
-Dversion=1.0-SNAPSHOT \
-Dpackage=com.company.project
```

<https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html>

```bash
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
```

<https://maven.apache.org/guides/getting-started/index.html>

```bash
mvn -B archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DgroupId=com.mycompany.app \
  -DartifactId=my-app
```
