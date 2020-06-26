# [VueJS - Events](https://www.tutorialspoint.com/vuejs/vuejs_events.htm)

## Click Event

```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://unpkg.com/vue"></script>
</head>
<body>
    <div id="app">
        <button v-on:click="displayTotal">Click Me</button>
        {{ num1 }} + {{ num2 }} = {{ total }}
    </div>
    <script type="text/javascript">
        new Vue({
            el: '#app',
            data: {
                num1: 100,
                num2: 200,
                total: ''
            },
            methods: {
                displayTotal: function (event) {
                    console.log(event)
                    return (this.total = this.num1 + this.num2)
                }
            }
        })
    </script>
</body>
</html>
```

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <div
      v-bind:style="styleObj"
      v-on:mouseover="changeBackgroundColor"
      v-on:mouseout="originalBackgroundColor">
    </div>
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        styleObj: {
          width: '200px',
          height: '100px',
          backgroundColor: 'red'
        }
      },
      methods: {
        changeBackgroundColor: function () {
          this.styleObj.backgroundColor = 'blue'
        },
        originalBackgroundColor: function () {
          this.styleObj.backgroundColor = 'red'
        }
      }
    })
  </script>
</body>
</html>
```

## Event Modifiers

**`.once`**
```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <button v-on:click.once="clickOnce">Click Once</button> {{ num1 }}
    <br>
    <button v-on:click="clickMe">Click Me</button> {{ num2 }}
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        num1: 0,
        num2: 0
      },
      methods: {
        clickOnce: function () {
          this.num1++
        },
        clickMe: function () {
          this.num2++
        }
      }
    })
  </script>
</body>
</html>
```

**`.prevent`**
```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <a
      href="https://www.tutorialspoint.com/" 
      v-on:click.prevent="clickPrevent" 
      target="_blank">
      Click Prevent
    </a>
    <br>
    <a
      href="https://www.tutorialspoint.com/" 
      v-on:click="clickMe" 
      target="_blank">
      Click Me
    </a>
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      methods: {
        clickPrevent: function () {
          alert('Anchor tag is clicked')
        },
        clickMe: function () {
          alert('Anchor tag is clicked')
        }
      }
    })
  </script>
</body>
</html>
```

## Event - Key Modifiers

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <!-- v-on:keyup.enter="showInputValue" -->
    <input type="text" v-on:keyup.ctrl.enter="showInputValue"> {{ name }}
  </div>
  <script type="text/javascript">
    new Vue({
      el: '#app',
      data: {
        name: ''
      },
      methods: {
        showInputValue: function (event) {
          this.name = event.target.value
        }
      }
    })
  </script>
</body>
</html>
```

## Custom Events

https://vuejs.org/v2/guide/list.html#key

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://unpkg.com/vue"></script>
</head>
<body>
  <div id="app">
    <language-button
      v-for="item in languages"
      v-bind:language="item"
      v-bind:key="item"
      v-on:clicklang="displayLanguage">
    </language-button>
    Language Displayed: {{ languageClicked }}
  </div>
  <script type="text/javascript">
    Vue.component('language-button', {
      props: ['language'],
      methods: {
        handleClickEvent: function (language) {
          this.$emit('clicklang', language)
        }
      },
      template: '<button v-on:click="handleClickEvent(language)">{{ language }}</button>'
    })

    new Vue({
      el: '#app',
      data: {
        languageClicked: '',
        languages: ["Java", "PHP", "C++", "C", "JavaScript", "C#", "Python", "HTML"]
      },
      methods: {
        displayLanguage: function (language) {
          this.languageClicked = language
        }
      }
    })
  </script>
</body>
</html>
```