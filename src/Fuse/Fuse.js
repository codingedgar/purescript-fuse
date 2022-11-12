import Fuse from 'fuse.js'

export function _newFuse(list, options) {
  return new Fuse(list, options);
}

/**
 * 
 * @param {Fuse} fuse 
 * @param {String} pattern 
 */
export function _search(fuse, pattern) {
    return fuse.search(pattern);
}
