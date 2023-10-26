const date_input = document.querySelector('#date_input')

date_input.addEventListener('input', handleInput, false)

function handleInput (e) {
  e.target.value = dateMask(e.target.value)
}

function dateMask (date) {
    console.log(date)
    return date.replace(/\D/g, '')
      .replace(/^(\d{2})(\d)/, '$1/$2')
      .replace(/^(\d{2})\/(\d{2})(\d)/, '$1/$2/$3')
      .replace(/(\/\d{4})\d+?$/, '$1');
  }