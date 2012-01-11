#= require jasmine.HeadlessReporter.ConsoleBase
#
class jasmine.HeadlessReporter.Verbose extends jasmine.HeadlessReporter.ConsoleBase
  displaySuccess: (spec) =>
    this.displaySpec(spec, 'green')

  displayFailure: (spec) =>
    this.displaySpec(spec, 'red')

  displaySpec: (spec, color) =>
    currentLastNames = (@lastNames || []).slice(0)
    @lastNames = spec.getSpecSplitName()

    this.puts(this.indentSpec(@lastNames, currentLastNames, color).join("\n"))

  indentSpec: (current, last, color) =>
    last = last.slice(0)

    lines = []

    for name in current
      if last.shift() != name
        lines.push(name)
      else
        lines.push(null)

    this.indentLines(lines, color)

  indentLines: (lines, color) =>
    indent = ''

    output = []

    for line in lines
      if line?
        outputLine = indent
        outputLine += this.colorLine(line, color)

        output.push(outputLine)
      indent += '  '

    output

  colorLine: (line, color) =>
    line.foreground(color)
