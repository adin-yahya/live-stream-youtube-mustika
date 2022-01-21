import Vue from 'vue'
import axios from 'axios'
// --------------------------------------------------------------
// Global Template helper
// --------------------------------------------------------------
const _permission = JSON.parse(localStorage.getItem('permission')) || []
const _theme = {
  isAllowed (permission) {
    if (permission === 'template-allow-all') return true
    else if (permission) _permission.includes(permission)
    else return false
  },
  togleClass (id, classname, boolean) {
    let component = document.getElementById(id)
    if (component) {
      if (boolean) {
        component.classList.add(classname)
      } else {
        component.classList.remove(classname)
      }
    }
  },
  encrypt (o, salt = 'PT Teknologi Aplikasi Sejahtera') {
    o = JSON.stringify(o).split('')
    for (var i = 0, l = o.length; i < l; i++) {
      if (o[i] === '{') { o[i] = '}' } else if (o[i] === '}') { o[i] = '{' }
    }
    return encodeURI(salt + o.join(''))
  },
  decrypt (o, salt = 'PT Teknologi Aplikasi Sejahtera') {
    o = decodeURI(o)
    if (salt && o.indexOf(salt) !== 0) { throw new Error('object cannot be decrypted') }
    o = o.substring(salt.length).split('')
    for (var i = 0, l = o.length; i < l; i++) {
      if (o[i] === '{') { o[i] = '}' } else if (o[i] === '}') { o[i] = '{' }
    }
    return JSON.parse(o.join(''))
  }
}
// --------------------------------------------------------------
// Global Service helper (Axios)
// --------------------------------------------------------------
const env = axios.create({
  // baseURL: 'http://127.0.0.1:8000/api/',
  baseURL: window.location.origin + '/api/',
  headers: {
    'X-Requested-With': 'XMLHttpRequest'
  }
})
env.interceptors.request.use(
  (config) => {
    let token = localStorage.getItem('_token_mustika')
    if (token) {
      config.headers['Authorization'] = `${token}`
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)
const _service = {
  signOut () {
    localStorage.clear()
    this.$router.push({ name: 'countdown' })
  },
  get (endPoint, param) {
    if (param && param.filter) {
      Object.assign(param, param.filter)
      delete param.filter
    }
    return env.get(`${endPoint}`, { params: param }).then(response => {
      return response.data
    }).catch((err) => {
      if (err.response.status === 401) this.signOut()
      else throw err.response
    })
  },
  post (endPoint, data) {
    return env.post(`${endPoint}`, data).then(response => {
      return response.data
    }).catch((err) => {
      if (err.response.status === 401) this.signOut()
      else throw err.response
    })
  },
  read (endPoint, id) {
    return env.post(`${endPoint}` + '/detail', id).then(response => {
      return response.data
    }).catch((err) => {
      if (err.response.status === 401) this.signOut()
      else throw err.response
    })
  },
  create (endPoint, data) {
    return env.post(`${endPoint}` + '/create', data).then(response => {
      return response.data
    }).catch((err) => {
      if (err.response.status === 401) this.signOut()
      else throw err.response
    })
  },
  update (endPoint, data) {
    return env.put(`${endPoint}` + '/update', data).then(response => {
      return response.data
    }).catch((err) => {
      if (err.response.status === 401) this.signOut()
      else throw err.response
    })
  },
  delete (endPoint, id) {
    return env.delete(`${endPoint}` + '/delete/'+ id).then(response => {
      return response.data
    }).catch((err) => {
      if (err.response.status === 401) this.signOut()
      else throw err.response
    })
  },
  empty (endPoint) {
    return env.delete(`${endPoint}` + '/empty').then(response => {
      return response.data
    }).catch((err) => {
      if (err.response.status === 401) this.signOut()
      else throw err.response
    })
  },
  fileUpload (endPoint, file, onUploadProgress) {
    let formData = new FormData()
    formData.append('file', file)
    return env.post(endPoint, formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      },
      onUploadProgress
    })
  }
}
const _alert = {
  error (err, title = null, text = null, toast = false) {
    Vue.swal({
      // position: 'bottom-right',
      icon: 'error',
      title: title || 'Error',
      text: text || err.data.error_message,
      toast: toast,
      timer: 3000,
      showConfirmButton: false
    })
  },
  success (title = null, text = null, toast = false) {
    Vue.swal({
      position: 'bottom-right',
      icon: 'success',
      title: title || 'Success',
      text: text,
      toast: toast,
      timer: 3000,
      showConfirmButton: false
    })
  }
}
const _sys = { ..._theme, ..._service, ..._alert }
export default _sys
