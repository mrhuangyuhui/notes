<!-- omit in toc -->
# Maven Manual

- [Install](#install)
- [Downloads](#downloads)
- [Commands](#commands)
- [Configurations](#configurations)
- [References](#references)
  - [POM](#pom)
  - [Plugins](#plugins)
  - [Profiles](#profiles)
- [Tutorials](#tutorials)
  - [Maven Documentation](#maven-documentation)
    - [Getting Started with Maven](#getting-started-with-maven)
    - [Introductions](#introductions)
    - [Guides](#guides)
  - [Learn Maven](#learn-maven)
- [Archetype](#archetype)

<https://maven.apache.org/>

[Maven Releases History](https://maven.apache.org/docs/history.html)

<http://search.maven.org/>

<https://mvnrepository.com/>

官方仓库 <http://central.maven.org/maven2/>

阿里云仓库 <http://maven.aliyun.com/nexus/content/groups/public/>

## Install

[`manuals/java/tools/maven/maven-install.md`](/manuals/java/tools/maven/maven-install.md)

## Downloads

<https://maven.apache.org/download.cgi>

## Commands

[`manuals/java/tools/maven/maven-cmd.md`](/manuals/java/tools/maven/maven-cmd.md)

## Configurations

[阿里云仓库](https://gitee.com/mrhuangyuhui/notes/blob/master/snippets/maven/maven-aliyun.md)

## References

[Lifecycle Reference](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Lifecycle_Reference)

[Built-in Lifecycle Bindings](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#Built-in_Lifecycle_Bindings)

[Settings Reference](https://maven.apache.org/ref/3.5.2/maven-settings/settings.html)

[Maven Archetypes](https://maven.apache.org/archetypes/index.html)

[Standard Directory Layout](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html)

[Maven Quick Reference Card](https://maven.apache.org/guides/MavenQuickReferenceCard.pdf)

### POM

<https://maven.apache.org/ref/3.5.2/maven-model/maven.html>

<https://maven.apache.org/xsd/maven-4.0.0.xsd>

- [activation](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_activation)
- [build](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_build)
- [execution](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_execution)
- [parent](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_parent)
- [plugin](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_plugin)
- [profile](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_profile)
- [resource](https://maven.apache.org/ref/3.5.2/maven-model/maven.html#class_resource)

### Plugins

[Available Plugins](https://maven.apache.org/plugins/) \
[Guide to Configuring Plug-ins](https://maven.apache.org/guides/mini/guide-configuring-plugins.html)

- [compiler](https://maven.apache.org/plugins/maven-compiler-plugin/)
- [help](https://maven.apache.org/plugins/maven-help-plugin/)
- [resources](https://maven.apache.org/plugins/maven-resources-plugin/)

### Profiles

[Introduction to Build Profiles](https://maven.apache.org/guides/introduction/introduction-to-profiles.html)

## Tutorials

### Maven Documentation

https://maven.apache.org/guides/

#### Getting Started with Maven

[Getting Started in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)

[Getting Started in 30 Minutes](https://maven.apache.org/guides/getting-started/index.html)

#### Introductions

[The Build Lifecycle](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)

[The POM](https://maven.apache.org/guides/introduction/introduction-to-the-pom.html)

[Profiles](https://maven.apache.org/guides/introduction/introduction-to-profiles.html)

[Standard Directory Layout](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html)

[The Dependency Mechanism](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html)

#### Guides

[Configuring Maven](https://maven.apache.org/guides/mini/guide-configuring-maven.html)

### [Learn Maven](https://www.tutorialspoint.com/maven/index.htm)

## [Archetype](https://maven.apache.org/archetype/index.html)

```bash
mvn archetype:generate
```

```bash
mvn archetype:generate -Dfilter=org.apache:struts
```

```bash
mvn archetype:generate -B -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.1 -DgroupId=com.company -DartifactId=project -Dversion=1.0-SNAPSHOT -Dpackage=com.company.project
```

[Maven Archetype](https://maven.apache.org/archetype/index.html)

[Maven Archetype Plugin](https://maven.apache.org/archetype/maven-archetype-plugin/index.html)

[Project creation](https://maven.apache.org/archetype/maven-archetype-plugin/usage.html)

[archetype:generate](http://maven.apache.org/archetype/maven-archetype-plugin/generate-mojo.html)

[Generate project in batch mode](https://maven.apache.org/archetype/maven-archetype-plugin/examples/generate-batch.html)

[Generate project using an alternative catalog](https://maven.apache.org/archetype/maven-archetype-plugin/examples/generate-alternative-catalog.html)

[Maven Archetypes](https://maven.apache.org/archetypes/)
