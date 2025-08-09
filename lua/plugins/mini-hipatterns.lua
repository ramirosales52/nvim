return {
  "echasnovski/mini.hipatterns",
  opts = function(_, opts)
    local hipatterns = require("mini.hipatterns")

    local function not_in_ts_capture(capture, group_fn)
      return function(buf_id, match, data)
        local caps = vim.treesitter.get_captures_at_pos(buf_id, data.line - 1, data.from_col - 1)
        for _, c in ipairs(caps) do
          if c.capture == capture then
            return nil
          end
        end
        return group_fn(buf_id, match, data)
      end
    end

    local function get_highlight(cb)
      return function(_, match)
        return hipatterns.compute_hex_color_group(cb(match), "bg")
      end
    end

    local function get_hex_long(match)
      return match
    end

    opts.highlighters = {
      hex_color = {
        pattern = "#%x%x%x%x%x%x%f[%X]",
        group = not_in_ts_capture("comment", get_highlight(get_hex_long)),
      },
    }

    return opts
  end,
}
