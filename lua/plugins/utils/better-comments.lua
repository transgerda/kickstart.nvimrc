return {
  'Djancyp/better-comments.nvim',
  event = 'VeryLazy',

  config = function() require('better-comment').Setup(opts) end,
}
