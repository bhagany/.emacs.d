;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ---------------------------
;;
;; Hagany: A dark color theme, based on Hickey
;;
;; ----------------------------

(unless (>= 24 emacs-major-version)
  (error "requires Emacs 24 or later."))

(deftheme hagany "A dark colour theme")

(let ((hagany-inverse-foreground  "#1D2021")
      (hagany-foreground          "#F8F8F2")
      (hagany-dark-gray           "#333333")
      (hagany-mid-gray            "#555555")
      (hagany-light-gray          "#666666")
      (hagany-lightest-gray       "#999999")
      (hagany-comment-slate       "#5C6A73")
      (hagany-orange              "#D48B53")
      (hagany-yellow              "#EEF294")
      (hagany-light-slate         "#465459")
      (hagany-dark-slate          (if (eq window-system nil) "#000000" "#161A1F"))
      (hagany-light-blue          "#A7DBD8")
      (hagany-strong-green        "#AEE239")
      (hagany-strong-blue         "#48ABE8")
      (hagany-subtle-blue         "#A7DBD8")
      (hagany-dirty-white         "#F8F8F0"))

  (custom-theme-set-faces
   'hagany

   ;; ----------------- Frame stuff --------------------
   `(default ((t (:background ,hagany-dark-slate :foreground ,hagany-foreground))))
   `(cursor  ((t (:background ,hagany-lightest-gray))))
   `(hl-line ((t (:background ,hagany-light-gray))))
   `(modeline ((t (:foreground ,hagany-lightest-gray :background ,hagany-mid-gray))))
   `(mode-line-inactive ((t (:box nil :foreground ,hagany-light-gray :background ,hagany-dark-gray))))
   `(mode-line ((t (:box nil :foreground ,hagany-inverse-foreground :background ,hagany-light-blue))))
   `(fringe ((t (:background ,hagany-dark-slate))))
   ;; Highlight region color
   `(region ((t (:foreground ,hagany-light-slate :background ,hagany-dark-slate))))
   ;; Dir-ed search prompt
   `(minibuffer-prompt ((default (:foreground ,hagany-light-blue))))

   ;; ---------------- Code Highlighting ---------------
   ;; Builtins
   `(font-lock-builtin-face ((t (:foreground ,hagany-yellow))))
   ;; Constants
   `(font-lock-constant-face ((t (:foreground ,hagany-strong-green))))
   ;; Comments
   `(font-lock-comment-face ((t (:foreground ,hagany-comment-slate))))
   ;; Function names
   `(font-lock-function-name-face ((t (:foreground ,hagany-strong-green))))
   ;; Keywords
   `(font-lock-keyword-face ((t (:foreground ,hagany-subtle-blue))))
   ;; Strings
   `(font-lock-string-face ((t (:foreground ,hagany-strong-blue))))
   ;; Variables
   `(font-lock-variable-name-face ((t (:foreground ,hagany-orange))))
   `(font-lock-type-face ((t (:foreground ,hagany-lightest-gray))))
   `(font-lock-warning-face ((t (:foreground ,hagany-lightest-gray :bold t))))

   ;; ---------------- Package Specific Stuff -----------
   ;; Powerline
   `(powerline-active1 ((t (:background ,hagany-dirty-white :foreground ,hagany-inverse-foreground))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name)))
  (when (not window-system)
    (custom-set-faces '(default ((t (:background nil)))))))

(provide-theme 'hagany)

;; Local Variables:
;; no-byte-compile: t
;; End:
