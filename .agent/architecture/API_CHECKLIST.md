# API Checklist

Use this checklist before implementing or approving a new API wrapper.

- [ ] Does the API exist in a real Web specification?
- [ ] Is a spec/MDN reference attached?
- [ ] Is module ownership clear in `MODULES.md`?
- [ ] Are dependencies minimal and justified?
- [ ] Does it require event integration (`Events` / `DOMEvents`)?
- [ ] Does it require JS bridge behavior through `WebFoundation`?
- [ ] Is naming aligned with Web semantics?
- [ ] Is Swift sugar additive only?
- [ ] Are async/promise error semantics preserved?
- [ ] Are closure lifecycle and release paths explicit?
