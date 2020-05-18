# Maven - Archetypes

[Introduction to Archetypes](https://maven.apache.org/guides/introduction/introduction-to-archetypes.html)

[Maven Archetype](https://maven.apache.org/archetype/index.html)

```bash
mvn archetype:generate
```

```bash
mvn archetype:generate -Dfilter=org.apache:struts
```

```bash
mvn archetype:generate -B -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.1 -DgroupId=com.company -DartifactId=project -Dversion=1.0-SNAPSHOT -Dpackage=com.company.project
```

[Maven Archetype Plugin](https://maven.apache.org/archetype/maven-archetype-plugin/index.html)

[Project creation](https://maven.apache.org/archetype/maven-archetype-plugin/usage.html)

[archetype:generate](http://maven.apache.org/archetype/maven-archetype-plugin/generate-mojo.html)

[Generate project in batch mode](https://maven.apache.org/archetype/maven-archetype-plugin/examples/generate-batch.html)

[Generate project using an alternative catalog](https://maven.apache.org/archetype/maven-archetype-plugin/examples/generate-alternative-catalog.html)
