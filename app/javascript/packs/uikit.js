import UIkit from 'uikit'
// import Icons from 'js/uikit-icons.js'
import Icons from 'uikit/dist/js/uikit-icons.js'

// loads the Icon plugin
UIkit.use(Icons);

document.addEventListener('DOMContentLoaded', () => {
  let notificationElem = document.getElementById('notice-container');
  console.log(notificationElem);
  if(notificationElem) {
    // UIkit.notification(notificationElem.children.notice.innerText, {status: 'primary'});
    UIkit.notification(notificationElem.children.notice.outerHTML,
      {status: 'primary', pos: 'bottom-right', timeout: 1000});
  }
})
