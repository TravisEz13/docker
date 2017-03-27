        Describe "travisez13/microsoft.windowsservercore.git:latest" {
            $repos = @(
                @{repo = 'travisez13/microsoft.windowsservercore.git_and_nuget'}
            )

            it "should contain git" -TestCases $repos {
                params(
                    [parameter(Mandatory)]
                    [string]$repo
                )

                start-process -Wait -filepath docker -argumentlist @('run', "${repo}:latest", 'nuget', 'locals','all','-list') -PassThru  -RedirectStandardError Testdrive:\stderr.txt -RedirectStandardOutput testdrive:\stdout.txt 
                Get-Content testdrive:\stderr.txt | should benullorempty
                Get-Content -raw -Path testdrive:\stdout.txt | should belike '*packages-cache*'
            }
        }